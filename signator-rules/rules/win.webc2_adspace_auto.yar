rule win_webc2_adspace_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.webc2_adspace."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_adspace"
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
        $sequence_0 = { ff15???????? 8d8580feffff 68???????? 50 e8???????? 8d4580 50 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8d8580feffff         | lea                 eax, [ebp - 0x180]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d4580               | lea                 eax, [ebp - 0x80]
            //   50                   | push                eax

        $sequence_1 = { ffd6 ff7508 ffd6 b8???????? 5e 5b c9 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ffd6                 | call                esi
            //   b8????????           |                     
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c9                   | leave               

        $sequence_2 = { 837c241001 6a00 750a 8d842420010000 50 eb01 57 }
            // n = 7, score = 100
            //   837c241001           | cmp                 dword ptr [esp + 0x10], 1
            //   6a00                 | push                0
            //   750a                 | jne                 0xc
            //   8d842420010000       | lea                 eax, [esp + 0x120]
            //   50                   | push                eax
            //   eb01                 | jmp                 3
            //   57                   | push                edi

        $sequence_3 = { 0f8570010000 be???????? 56 55 ffd3 }
            // n = 5, score = 100
            //   0f8570010000         | jne                 0x176
            //   be????????           |                     
            //   56                   | push                esi
            //   55                   | push                ebp
            //   ffd3                 | call                ebx

        $sequence_4 = { ff15???????? 8b1d???????? 8d842428010000 50 55 ffd3 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8b1d????????         |                     
            //   8d842428010000       | lea                 eax, [esp + 0x128]
            //   50                   | push                eax
            //   55                   | push                ebp
            //   ffd3                 | call                ebx

        $sequence_5 = { 750a 8d842420010000 50 eb01 57 55 }
            // n = 6, score = 100
            //   750a                 | jne                 0xc
            //   8d842420010000       | lea                 eax, [esp + 0x120]
            //   50                   | push                eax
            //   eb01                 | jmp                 3
            //   57                   | push                edi
            //   55                   | push                ebp

        $sequence_6 = { eb13 8b35???????? 53 ffd6 ff7508 ffd6 }
            // n = 6, score = 100
            //   eb13                 | jmp                 0x15
            //   8b35????????         |                     
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ffd6                 | call                esi

        $sequence_7 = { e8???????? 6a03 e8???????? 8b35???????? 68???????? ffd6 8bf8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a03                 | push                3
            //   e8????????           |                     
            //   8b35????????         |                     
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   8bf8                 | mov                 edi, eax

        $sequence_8 = { 56 57 6a1f 59 33c0 8d7d81 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a1f                 | push                0x1f
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   8d7d81               | lea                 edi, [ebp - 0x7f]

        $sequence_9 = { c9 c3 8bc1 c3 c3 8b442404 }
            // n = 6, score = 100
            //   c9                   | leave               
            //   c3                   | ret                 
            //   8bc1                 | mov                 eax, ecx
            //   c3                   | ret                 
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]

    condition:
        7 of them and filesize < 49152
}