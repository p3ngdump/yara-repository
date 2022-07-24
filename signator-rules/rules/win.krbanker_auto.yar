rule win_krbanker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.krbanker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.krbanker"
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
        $sequence_0 = { 3bf2 7d02 33f6 8a4500 240c }
            // n = 5, score = 400
            //   3bf2                 | cmp                 esi, edx
            //   7d02                 | jge                 4
            //   33f6                 | xor                 esi, esi
            //   8a4500               | mov                 al, byte ptr [ebp]
            //   240c                 | and                 al, 0xc

        $sequence_1 = { 47 4b 3bdd 0f8d5bffffff }
            // n = 4, score = 400
            //   47                   | inc                 edi
            //   4b                   | dec                 ebx
            //   3bdd                 | cmp                 ebx, ebp
            //   0f8d5bffffff         | jge                 0xffffff61

        $sequence_2 = { 57 50 680c000000 e8???????? }
            // n = 4, score = 400
            //   57                   | push                edi
            //   50                   | push                eax
            //   680c000000           | push                0xc
            //   e8????????           |                     

        $sequence_3 = { 81f901020080 7440 81f901030080 7438 81f901040080 7430 }
            // n = 6, score = 400
            //   81f901020080         | cmp                 ecx, 0x80000201
            //   7440                 | je                  0x42
            //   81f901030080         | cmp                 ecx, 0x80000301
            //   7438                 | je                  0x3a
            //   81f901040080         | cmp                 ecx, 0x80000401
            //   7430                 | je                  0x32

        $sequence_4 = { 753b 8b442414 8d48fe 8d0440 }
            // n = 4, score = 400
            //   753b                 | jne                 0x3d
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8d48fe               | lea                 ecx, [eax - 2]
            //   8d0440               | lea                 eax, [eax + eax*2]

        $sequence_5 = { 895dec 8b5dec 8b03 33c9 }
            // n = 4, score = 400
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx
            //   8b5dec               | mov                 ebx, dword ptr [ebp - 0x14]
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   33c9                 | xor                 ecx, ecx

        $sequence_6 = { 83ec28 8b44243c 53 55 56 8b500c 8b08 }
            // n = 7, score = 400
            //   83ec28               | sub                 esp, 0x28
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]
            //   53                   | push                ebx
            //   55                   | push                ebp
            //   56                   | push                esi
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_7 = { 894604 85c0 753b 8b442414 8d48fe 8d0440 }
            // n = 6, score = 400
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   85c0                 | test                eax, eax
            //   753b                 | jne                 0x3d
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8d48fe               | lea                 ecx, [eax - 2]
            //   8d0440               | lea                 eax, [eax + eax*2]

        $sequence_8 = { 8b5df8 668903 8b5dfc 83c308 895df8 }
            // n = 5, score = 400
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   668903               | mov                 word ptr [ebx], ax
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   83c308               | add                 ebx, 8
            //   895df8               | mov                 dword ptr [ebp - 8], ebx

        $sequence_9 = { 33c0 5e 83c408 c3 8b4c2420 8b542404 8d442408 }
            // n = 7, score = 400
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   83c408               | add                 esp, 8
            //   c3                   | ret                 
            //   8b4c2420             | mov                 ecx, dword ptr [esp + 0x20]
            //   8b542404             | mov                 edx, dword ptr [esp + 4]
            //   8d442408             | lea                 eax, [esp + 8]

    condition:
        7 of them and filesize < 1826816
}