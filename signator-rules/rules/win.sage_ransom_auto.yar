rule win_sage_ransom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.sage_ransom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sage_ransom"
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
        $sequence_0 = { 8bd1 81e2000000f0 81fa000000f0 0f84a3000000 6a10 8d442424 50 }
            // n = 7, score = 300
            //   8bd1                 | mov                 edx, ecx
            //   81e2000000f0         | and                 edx, 0xf0000000
            //   81fa000000f0         | cmp                 edx, 0xf0000000
            //   0f84a3000000         | je                  0xa9
            //   6a10                 | push                0x10
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   50                   | push                eax

        $sequence_1 = { 8b2d???????? 8bd8 ffd5 3db7000000 752e }
            // n = 5, score = 300
            //   8b2d????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   ffd5                 | call                ebp
            //   3db7000000           | cmp                 eax, 0xb7
            //   752e                 | jne                 0x30

        $sequence_2 = { 7509 c60120 ba01000000 41 46 3bf7 }
            // n = 6, score = 300
            //   7509                 | jne                 0xb
            //   c60120               | mov                 byte ptr [ecx], 0x20
            //   ba01000000           | mov                 edx, 1
            //   41                   | inc                 ecx
            //   46                   | inc                 esi
            //   3bf7                 | cmp                 esi, edi

        $sequence_3 = { 81c40c010000 c3 5f 5e 5d b8fcffffff }
            // n = 6, score = 300
            //   81c40c010000         | add                 esp, 0x10c
            //   c3                   | ret                 
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   b8fcffffff           | mov                 eax, 0xfffffffc

        $sequence_4 = { 8d4c2440 51 8d542464 52 e8???????? 8b84243c010000 83c020 }
            // n = 7, score = 300
            //   8d4c2440             | lea                 ecx, [esp + 0x40]
            //   51                   | push                ecx
            //   8d542464             | lea                 edx, [esp + 0x64]
            //   52                   | push                edx
            //   e8????????           |                     
            //   8b84243c010000       | mov                 eax, dword ptr [esp + 0x13c]
            //   83c020               | add                 eax, 0x20

        $sequence_5 = { e8???????? 8b35???????? 83c404 68e0930400 ffd6 }
            // n = 5, score = 300
            //   e8????????           |                     
            //   8b35????????         |                     
            //   83c404               | add                 esp, 4
            //   68e0930400           | push                0x493e0
            //   ffd6                 | call                esi

        $sequence_6 = { 8d542408 52 e8???????? 8d44240c 50 }
            // n = 5, score = 300
            //   8d542408             | lea                 edx, [esp + 8]
            //   52                   | push                edx
            //   e8????????           |                     
            //   8d44240c             | lea                 eax, [esp + 0xc]
            //   50                   | push                eax

        $sequence_7 = { e8???????? 83c410 33c0 85ff 7419 }
            // n = 5, score = 300
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   33c0                 | xor                 eax, eax
            //   85ff                 | test                edi, edi
            //   7419                 | je                  0x1b

        $sequence_8 = { 891424 ff90dc010000 50 8b8d38ffffff 89742404 8b35???????? c744241000000000 }
            // n = 7, score = 200
            //   891424               | mov                 dword ptr [esp], edx
            //   ff90dc010000         | call                dword ptr [eax + 0x1dc]
            //   50                   | push                eax
            //   8b8d38ffffff         | mov                 ecx, dword ptr [ebp - 0xc8]
            //   89742404             | mov                 dword ptr [esp + 4], esi
            //   8b35????????         |                     
            //   c744241000000000     | mov                 dword ptr [esp + 0x10], 0

        $sequence_9 = { 01410c 8b4310 014110 8b4314 }
            // n = 4, score = 200
            //   01410c               | add                 dword ptr [ecx + 0xc], eax
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   014110               | add                 dword ptr [ecx + 0x10], eax
            //   8b4314               | mov                 eax, dword ptr [ebx + 0x14]

        $sequence_10 = { 013c13 83c102 46 ebd3 }
            // n = 4, score = 200
            //   013c13               | add                 dword ptr [ebx + edx], edi
            //   83c102               | add                 ecx, 2
            //   46                   | inc                 esi
            //   ebd3                 | jmp                 0xffffffd5

        $sequence_11 = { 0101 8b4304 014104 8b4308 014108 }
            // n = 5, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   014104               | add                 dword ptr [ecx + 4], eax
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   014108               | add                 dword ptr [ecx + 8], eax

        $sequence_12 = { 014114 8b4318 014118 8b431c }
            // n = 4, score = 200
            //   014114               | add                 dword ptr [ecx + 0x14], eax
            //   8b4318               | mov                 eax, dword ptr [ebx + 0x18]
            //   014118               | add                 dword ptr [ecx + 0x18], eax
            //   8b431c               | mov                 eax, dword ptr [ebx + 0x1c]

        $sequence_13 = { 014108 8b430c 01410c 8b4310 }
            // n = 4, score = 200
            //   014108               | add                 dword ptr [ecx + 8], eax
            //   8b430c               | mov                 eax, dword ptr [ebx + 0xc]
            //   01410c               | add                 dword ptr [ecx + 0xc], eax
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]

        $sequence_14 = { 014110 8b4314 014114 8b4318 }
            // n = 4, score = 200
            //   014110               | add                 dword ptr [ecx + 0x10], eax
            //   8b4314               | mov                 eax, dword ptr [ebx + 0x14]
            //   014114               | add                 dword ptr [ecx + 0x14], eax
            //   8b4318               | mov                 eax, dword ptr [ebx + 0x18]

        $sequence_15 = { 0119 117104 83c110 83c210 }
            // n = 4, score = 200
            //   0119                 | add                 dword ptr [ecx], ebx
            //   117104               | adc                 dword ptr [ecx + 4], esi
            //   83c110               | add                 ecx, 0x10
            //   83c210               | add                 edx, 0x10

    condition:
        7 of them and filesize < 335872
}