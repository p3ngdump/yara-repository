rule win_htprat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.htprat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.htprat"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 66894c0588 83c002 663bcb 75eb eb18 6a64 8d4588 }
            // n = 7, score = 200
            //   66894c0588           | mov                 word ptr [ebp + eax - 0x78], cx
            //   83c002               | add                 eax, 2
            //   663bcb               | cmp                 cx, bx
            //   75eb                 | jne                 0xffffffed
            //   eb18                 | jmp                 0x1a
            //   6a64                 | push                0x64
            //   8d4588               | lea                 eax, [ebp - 0x78]

        $sequence_1 = { 68???????? 8d8554ffffff 50 c645fc02 e8???????? }
            // n = 5, score = 200
            //   68????????           |                     
            //   8d8554ffffff         | lea                 eax, [ebp - 0xac]
            //   50                   | push                eax
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   e8????????           |                     

        $sequence_2 = { c7852cefffff03000000 e8???????? 83c40c ffb550efffff }
            // n = 4, score = 200
            //   c7852cefffff03000000     | mov    dword ptr [ebp - 0x10d4], 3
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   ffb550efffff         | push                dword ptr [ebp - 0x10b0]

        $sequence_3 = { e8???????? 33c0 c645fc04 53 8db7a4000000 898794000000 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   53                   | push                ebx
            //   8db7a4000000         | lea                 esi, [edi + 0xa4]
            //   898794000000         | mov                 dword ptr [edi + 0x94], eax

        $sequence_4 = { 8945b4 3bc7 0f849d000000 8d45b4 8d75bc }
            // n = 5, score = 200
            //   8945b4               | mov                 dword ptr [ebp - 0x4c], eax
            //   3bc7                 | cmp                 eax, edi
            //   0f849d000000         | je                  0xa3
            //   8d45b4               | lea                 eax, [ebp - 0x4c]
            //   8d75bc               | lea                 esi, [ebp - 0x44]

        $sequence_5 = { 8d4740 8bce e8???????? 8d8424b8000000 50 }
            // n = 5, score = 200
            //   8d4740               | lea                 eax, [edi + 0x40]
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8d8424b8000000       | lea                 eax, [esp + 0xb8]
            //   50                   | push                eax

        $sequence_6 = { 66833800 0f8501ffffff 32c0 5f 5e 5b c3 }
            // n = 7, score = 200
            //   66833800             | cmp                 word ptr [eax], 0
            //   0f8501ffffff         | jne                 0xffffff07
            //   32c0                 | xor                 al, al
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c3                   | ret                 

        $sequence_7 = { 6a02 ff15???????? 6a00 ff35???????? ff15???????? 6a01 ff35???????? }
            // n = 7, score = 200
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   ff35????????         |                     

        $sequence_8 = { 750c 8b03 6683387d 0f84a8010000 8365e400 33c0 }
            // n = 6, score = 200
            //   750c                 | jne                 0xe
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   6683387d             | cmp                 word ptr [eax], 0x7d
            //   0f84a8010000         | je                  0x1ae
            //   8365e400             | and                 dword ptr [ebp - 0x1c], 0
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 0f84d1010000 8b03 668b08 83c002 8903 6683f93a 0f85eb010000 }
            // n = 7, score = 200
            //   0f84d1010000         | je                  0x1d7
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   668b08               | mov                 cx, word ptr [eax]
            //   83c002               | add                 eax, 2
            //   8903                 | mov                 dword ptr [ebx], eax
            //   6683f93a             | cmp                 cx, 0x3a
            //   0f85eb010000         | jne                 0x1f1

    condition:
        7 of them and filesize < 278528
}