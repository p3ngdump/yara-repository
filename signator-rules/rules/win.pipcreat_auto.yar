rule win_pipcreat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.pipcreat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pipcreat"
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
        $sequence_0 = { 66833d????????31 742b 6a00 6a00 6a00 }
            // n = 5, score = 100
            //   66833d????????31     |                     
            //   742b                 | je                  0x2d
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_1 = { ff15???????? 83c408 85c0 7523 8b442428 8b4c242c 8d542404 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7523                 | jne                 0x25
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   8d542404             | lea                 edx, [esp + 4]

        $sequence_2 = { 50 0fb745e8 50 68a8410010 68f4460010 ff15???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   0fb745e8             | movzx               eax, word ptr [ebp - 0x18]
            //   50                   | push                eax
            //   68a8410010           | push                0x100041a8
            //   68f4460010           | push                0x100046f4
            //   ff15????????         |                     

        $sequence_3 = { 8d4c2408 50 50 50 }
            // n = 4, score = 100
            //   8d4c2408             | lea                 ecx, [esp + 8]
            //   50                   | push                eax
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_4 = { e8???????? 295dfc 8d85fcdfffff ff75fc 50 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   295dfc               | sub                 dword ptr [ebp - 4], ebx
            //   8d85fcdfffff         | lea                 eax, [ebp - 0x2004]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_5 = { eb0c 68fc400010 eb05 68ec400010 8d8538ffffff 50 ff15???????? }
            // n = 7, score = 100
            //   eb0c                 | jmp                 0xe
            //   68fc400010           | push                0x100040fc
            //   eb05                 | jmp                 7
            //   68ec400010           | push                0x100040ec
            //   8d8538ffffff         | lea                 eax, [ebp - 0xc8]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_6 = { 56 51 ff35???????? 8d4d10 51 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   51                   | push                ecx
            //   ff35????????         |                     
            //   8d4d10               | lea                 ecx, [ebp + 0x10]
            //   51                   | push                ecx

        $sequence_7 = { 57 50 ff75f4 ff15???????? 395dfc 747c }
            // n = 6, score = 100
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff15????????         |                     
            //   395dfc               | cmp                 dword ptr [ebp - 4], ebx
            //   747c                 | je                  0x7e

        $sequence_8 = { 50 ff35???????? e8???????? 83c420 5f 5e 33c0 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff35????????         |                     
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 57 be9c400010 8d7df8 8d45f8 a5 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   be9c400010           | mov                 esi, 0x1000409c
            //   8d7df8               | lea                 edi, [ebp - 8]
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

    condition:
        7 of them and filesize < 65536
}